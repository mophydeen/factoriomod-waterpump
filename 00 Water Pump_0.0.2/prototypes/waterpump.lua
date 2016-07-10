local assemblingmachineitem = util.table.deepcopy(data.raw["item"]["assembling-machine-3"])
assemblingmachineitem.name = "water-pump"
assemblingmachineitem.icon = "__00 Water Pump__/graphics/icons/water-pump.png"
assemblingmachineitem.order = "w[water-pump]"
assemblingmachineitem.place_result = "water-pump"
data:extend{assemblingmachineitem}


data:extend({
  {
    type = "recipe",
    name = "ground-water",
    category = "water-pump",
    enabled = false,
    energy_required = 1,
    ingredients =
    {
    },
    results = 
    {
      {type="fluid", name="water", amount=10}
    },
    subgroup = "fluid-recipes",
    order = "h[fluid-chemistry]-h[ground-water]",
    icon = "__base__/graphics/icons/fluid/water.png",
  },
})

local waterpumprecipe = util.table.deepcopy(data.raw["recipe"]["pumpjack"])
waterpumprecipe.name = "water-pump"
waterpumprecipe.ingredients = {
 	{"steel-plate", 20},
    {"iron-gear-wheel", 20},
    {"electronic-circuit", 20},
    {"pipe", 20},
}
waterpumprecipe.result = "water-pump"
data:extend{waterpumprecipe}

local fluidbox = {
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 1} }}
      },
      off_when_no_fluid_recipe = false
    }

local waterpump = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])
waterpump.name="water-pump"
waterpump.minable.result="water-pump"
waterpump.icon = "__00 Water Pump__/graphics/icons/water-pump.png"
waterpump.animation.tint = {r=.078,g=.86274,b=1,a=1}
waterpump.crafting_categories = {"water-pump"}
waterpump.animation.scale = 0.33
waterpump.animation.shift = {0.28, 0}
waterpump.fast_replaceable_group = "water-pump"
waterpump.collision_box = {{-0.29, -0.29}, {0.29, 0.29}}
waterpump.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
waterpump.fluid_boxes = fluidbox
waterpump.crafting_speed = 8
waterpump.module_specification.module_slots = 4
data:extend{waterpump}


data:extend(
{
  {
    type = "technology",
    name = "water-pump",
    icon = "__00 Water Pump__/graphics/icons/water-pump.png",
    prerequisites =
    {
      "oil-processing",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "water-pump"
      },      
      {
        type = "unlock-recipe",
        recipe = "ground-water"
      },
    },
    unit =
    {
      count = 150,
      ingredients = 
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 10
    },
    upgrade = true,
    order = "d-c-c1"
  },
})

