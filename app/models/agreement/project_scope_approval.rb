class Agreement::ProjectScopeApproval < Agreement
  def approvable
    self.payment_schedules.last
  end
end