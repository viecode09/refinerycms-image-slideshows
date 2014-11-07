module Refinery
  module ImageSlideshows
    module Admin
      class ImageSlidesController < ::Refinery::AdminController

        crudify :'refinery/image_slideshows/image_slide', :sortable => true

        before_filter :find_image_slideshow
        before_filter :find_image_slides, only: :index
        before_filter :find_image_slide, :except => [:index]

        def create
          if Refinery::ImageSlideshows::ImageSlide.any?
            @image_slide.position = Refinery::ImageSlideshows::ImageSlide.maximum(:position) + 1
          else
            @image_slide.position = 1
          end

          if @image_slide.valid? && @image_slide.save
            redirect_to image_slides_path, :notice => 'Image slide was successfully created.'
          else
            render :action => :new
          end
        end

        def update
          if @image_slide.update_attributes(params[:image_slide])
            redirect_to image_slides_path, :notice => 'Image slide was successfully updated.'
          else
            render :action => :edit
          end
        end

        def destroy
          if @image_slide.destroy
            redirect_to image_slides_path, :notice => 'Image slide was successfully deleted.'
          end
        end

        private

          def image_slide_params
            params.require(:image_slide).permit(
              :id,
              :title,
              :image_id,
              :caption,
              :position,
              :image_slideshow_id
            )
          end

        def image_slides_path
          refinery.image_slideshows_admin_image_slideshow_image_slides_path(@image_slideshow)
        end

        def find_image_slide
          @image_slide = Refinery::ImageSlideshows::ImageSlide.find(params[:id]) if params[:id]
          @image_slide ||= Refinery::ImageSlideshows::ImageSlide.new(image_slide_params) if params[:image_slide]
        end

        def find_image_slideshow
          @image_slideshow = Refinery::ImageSlideshows::ImageSlideshow.find(params[:image_slideshow_id])
        end

        def find_image_slides
          @image_slides = @image_slideshow.image_slides.order(:position) if @image_slideshow.present?
        end
      end
    end
  end
end