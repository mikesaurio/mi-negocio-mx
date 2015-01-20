require 'rails_helper'

feature 'A visitor enters the page' do
  attr_reader :city, :inspections

  before(:all) do
    @city = create :municipio
    dependency = create :dependency, municipio: city
    @inspections = []
    3.times { @inspections << create(:inspection, dependency: dependency) }
  end

  scenario 'and goes to the city inspections list' do
    # Given a city's, go to the inspections page
    visitor_navigates_to_city_inspections_from(city)

    # Are we in the correct path?
    expect(current_path).to eq municipio_inspections_path(city)

    # Check that there is a listing with all 3 inspections created before
    inspections.each do |inspection|
      expect(page).to have_content inspection.nombre
    end
  end

  scenario 'a visits the last inspection from the list' do
    visitor_navigates_to_city_inspections_from(city)

    # click on the last inspection from the list
    visit_last_inspection_detail

    # let's check that the path is equal to the the last isnpection :show path
    # for this resource
    raise current_path.inspect
    expect(current_path).to eq(municipio_inspection_path(last_inspection))

    # let's check for 'some' information of the resource
    expect(page).to have_content last_inspection.nombre
    expect(page).to have_content last_inspection.materia
    expect(page).to have_content last_inspection.duracion

    # save_and_open_page
  end


  def visitor_navigates_to_city_inspections_from(current_city)
    visit root_path
    select current_city.nombre, from: 'post_municipio'
    click_on 'Continuar'
    click_on 'Inspecciones'
  end

  def visit_last_inspection_detail
    click_on last_inspection.nombre
  end

  def last_inspection
    inspections.last
  end
end
