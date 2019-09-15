module CompaniesHelper
    def current_company
        Company.find(current_user.company_id)
    end
end
