# frozen_string_literal: true

class RetrospectivesController < ApplicationController
  before_action :set_retrospective, only: [:show, :edit, :update, :destroy]

  # GET /retrospectives or /retrospectives.json
  def index
    @retrospectives = Retrospective.all
  end

  # GET /retrospectives/1 or /retrospectives/1.json
  def show
  end

  # GET /retrospectives/new
  def new
    @retrospective = Retrospective.new
  end

  # GET /retrospectives/1/edit
  def edit
  end

  # POST /retrospectives or /retrospectives.json
  def create
    @retrospective = Retrospective.new(retrospective_params)

    respond_to do |format|
      if @retrospective.save
        format.html do
          redirect_to(retrospective_url(@retrospective), notice: "Retrospective was successfully created.")
        end
        format.json { render(:show, status: :created, location: @retrospective) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @retrospective.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /retrospectives/1 or /retrospectives/1.json
  def update
    respond_to do |format|
      if @retrospective.update(retrospective_params)
        format.html do
          redirect_to(retrospective_url(@retrospective), notice: "Retrospective was successfully updated.")
        end
        format.json { render(:show, status: :ok, location: @retrospective) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @retrospective.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /retrospectives/1 or /retrospectives/1.json
  def destroy
    @retrospective.destroy!

    respond_to do |format|
      format.html { redirect_to(retrospectives_url, notice: "Retrospective was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_retrospective
    @retrospective = Retrospective.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def retrospective_params
    params.require(:retrospective).permit(:notes, :score, :interview_id, :application_id)
  end
end
