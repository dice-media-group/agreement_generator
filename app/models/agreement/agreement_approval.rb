class Agreement::AgreementApproval < Agreement
  # @agreement.approvals.new
  def approvable
    self
  end
end

