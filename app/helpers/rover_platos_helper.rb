module RoverPlatosHelper
  def rover_plato_position(x, y)
    if @rover_plato.position[[x, y]]
      rover_image
    else
      "fa fa-times fa-3x"
    end
  end

  def rover_image
    image_rules = {'E' => "fa fa-arrow-right fa-3x",
                   'N' => "fa fa-arrow-up fa-3x",
                   'W' => "fa fa-arrow-left fa-3x",
                   'S' => "fa fa-arrow-down fa-3x"}
    image_rules[@rover.direction]
 end
end
