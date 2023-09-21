class MaterialsController < ApplicationController
        before_action :set_discipline
        before_action :set_material, only: %i[ show edit update destroy ]
      
        def index
          @materials = @discipline.materials
        end
      
        def show
        end
      
        def new
          @material = @discipline.materials.new
        end
      
        def edit
        end
      
        def create
          @material = @discipline.materials.new(material_params)
      
          if @material.save
            redirect_to [@discipline, @material], notice: 'Материал успешно создан.'
          else
            render :new
          end
        end
      
        def update
          if @material.update(material_params)
            redirect_to [@discipline, @material], notice: 'Материал успешно обновлен.'
          else
            render :edit
          end
        end
      
        def destroy
          @material.destroy
          redirect_to disciplines_url(@discipline), notice: 'Материал успешно удален.'
        end
      
        private
      
        def set_discipline
          @discipline = Discipline.find(params[:discipline_id])
        end
      
        def set_material
          @material = @discipline.materials.find(params[:id])
        end
      
        def material_params
          params.require(:material).permit(:name, :description, :file)
        end
end
