module ApplicationHelper

    def sort_link(model:, column:, label:)
        if column == params[:column]
            link_to(label, polymorphic_path(model, action: "list", column: column, direction: next_direction), data: { 'turbo-method' => :post })
        else
            link_to(label, polymorphic_path(model, action: "list", column: column, direction: 'asc'), data: { 'turbo-method' => :post })
        end
    end

    def next_direction
        params[:direction] == 'asc' ? 'desc' : 'asc'
    end

    def sort_indicator
        tag.span(class: "sort sort-#{params[:direction]}")
    end

end
