module ApplicationHelper

    def sort_link(model:, column:, label:, control:)
        if column == params[:column]
            link_to(label, polymorphic_path(model, action: "list", column: column, direction: next_direction, control: control), data: { 'turbo-method' => :post })
        else
            link_to(label, polymorphic_path(model, action: "list", column: column, direction: 'asc', control: control), data: { 'turbo-method' => :post })
        end
    end

    def next_direction
        params[:direction] == 'asc' ? 'desc' : 'asc'
    end

    def sort_indicator
        tag.span(class: "sort sort-#{params[:direction]}")
    end

    def select_chantiers
        if @client
            @client.id
        elsif controller_name == "chantiers"
            "chantiers"
        end
    end

    def select_commandes
        if @fournisseur
            @fournisseur.id
        elsif controller_name == "commandes"
            "commandes"
        end
    end

end
