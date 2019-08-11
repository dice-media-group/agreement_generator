class Agreement::PaymentScheduleApproval < Agreement
	# @agreement.payment_schedules.last.approvals.new
  def approvable
    self.payment_schedules.last
  end

end