module Admin
    class EventPreviewsController < ApplicationController
      include EventsHelper
  
      before_action :ensure_admin
      before_action :set_event

      def index
        @event_previews = @event.event_previews.order(created_at: :desc)
      end
  
      def new
        @event_preview = @event.event_previews.build
        @event_preview.build_image
      end
  
      def create
        @event_preview = @event.event_previews.build(event_preview_params)
        if @event_preview.save
          redirect_to admin_event_event_previews_path, notice: 'Event preview was successfully created.'
        else
          @event_preview.build_image
          render :new
        end
      end
  
      def destroy
        @event_preview = @event.event_previews.find(params[:id])
        @event_preview.destroy
        redirect_to admin_event_event_previews_path(@event.year), notice: 'Event preview was successfully destroyed.'
      end
  
      private
        def event_preview_params
          params.require(:event_preview).permit(:image_link, image_attributes: [:id, :file, :_destroy])
        end
    end
  end