require 'rails'

module Adminsimple
  class Engine < ::Rails::Engine
    engine_name 'adminsimple'

    initializer "adminsimple.view_helpers" do

      ActiveSupport.on_load :action_view do
        Rails.application.reloader.to_prepare do
          ActionView::Base.send :include, Adminsimple::ViewHelpers
          ActionView::Base.send :include, Adminsimple::Modules::WidgetBoxHelpers
          ActionView::Base.send :include, Adminsimple::Modules::PageHeaderHelpers
        end
      end
    end

  end
end
