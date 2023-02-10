module UsersHelper
    def build_order_link(column:, label:)
        if column == session.dig('user_filters', 'column')
          link_to(label, list_users_path(column: column, direction: next_direction))
        else
          link_to(label, list_users_path(column: column, direction: 'asc'))
        end
      end
    
      def next_direction
        session['user_filters']['direction'] == 'asc' ? 'desc' : 'asc'
      end
    
      def sort_indicator
        tag.span(class: "sort sort-#{session['user_filters']['direction']}")
      end
end
