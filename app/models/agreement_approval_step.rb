class AgreementApprovalStep
	attr_reader :step_params_id, :agreement_id, :steps, :steps_join_tables, :approvable

	def initialize(agreement_id:,
			steps_join_tables: ['', 'deliverables', 'scheduled_payments'],
			step_params_id: 'agreement_approval'
		)
		@agreement_id 		= agreement_id
      	@steps_join_tables	= steps_join_tables
      	@steps 				= steps
      	@step_params_id 	= step_params_id
      	@approvable 		= approvable

	end

	def agreement
		Agreement.find(agreement_id)
	end
	def project
		agreement.project
	end

	def document
		agreement.document
	end

	def steps
		steps = []
		steps << 'agreement_approval'
		if agreement.project_scopes.length > 0
			steps << 'project_scope_approval'
		end
		if agreement.payment_schedules.length > 0
			steps << 'payment_schedule_approval'
		end
		steps
	end

    def wizard_step_approvable
      # create a hash, STEP_JOIN_LOOKUP, with STEPS as key and STEP_JOIN_TABLES as values
      # keys.zip(values) { |a,b| h[a.to_sym] = b } 
      step_join_lookup_hash  = {}

      steps.zip(steps_join_tables) { |a,b| step_join_lookup_hash[a] = b } 
      # appovable is a child of @agreement (e.g. payment_schedule, project_scope)
      # we use joins to get the parent since child is has_many :through
      if step == 'agreement_approval'
        approvable = Agreement.find(agreement_id)
      else
        approvable_class  = step.split("_approval").first.camelcase.constantize
        approvable_join_table   = step_join_lookup_hash[step]
        approvable   = approvable_class.joins(approvable_join_table.to_sym).where("#{approvable_join_table.to_sym}.agreement_id = ?", agreement_id).distinct.last
      end
      approvable
    end

    def step
      step_name = self.steps.find {|a_step| a_step == step_params_id.to_s.downcase}
    end

    def next_step
      current_step_index = self.steps.index(step)
      next_step = steps[current_step_index+1]
    end

    def step_document_partial
    	"#{step}_document"
    end
 	
end
