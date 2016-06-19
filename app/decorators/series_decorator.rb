class SeriesDecorator < Draper::Decorator
  delegate_all

  def cars
    model.cars.join(', ')
  end

  def full_name
    [
      "[#{license}]",
      "[#{race_type}]",
      name
    ].join ' '
  end
end
