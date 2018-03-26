module ApplicationHelper
    def full_title(page_title='')
        base_title="Kakeibo"
        if page_title.empty?
            base_title
        else
            base_title+"_"+page_title  
        end
    end
end
