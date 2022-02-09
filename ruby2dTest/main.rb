require 'ruby2d'

# Set the window size
set title: "Hello Triangle"

# Moving square
square = Square.new(x: 10, y: 20, size: 25, color: 'blue')
update do
  square.x = Window.mouse_x
  square.y = Window.mouse_y
end

# Coin Sprite
coin = Sprite.new(
    'coin.png',
    clip_width: 84,
    time: 50,
    loop: true
  )
coin.play 
# boom Sprite
boom = Sprite.new(
    'boom.png',
    clip_width: 127,
    time: 75,
    x:85
  )
boom.play

# Hero
hero = Sprite.new(
    'hero.png',
    width: 78,
    height: 99,
    clip_width: 78,
    time: 250,
    y:100,
    animations: {
      walk: 1..2,
      climb: 3..4,
      cheer: 5..6
    }
  )
  on :key_down do |event|
    case event.key
      when 'left'
        hero.play animation: :walk, loop: true, flip: :horizontal
      when 'right'
        hero.play animation: :walk, loop: true
      when 'up'
        hero.play animation: :climb, loop: true
      when 'down'
        hero.play animation: :climb, loop: true, flip: :vertical
      when 'c'
        hero.play animation: :cheer
    end
  end
  #atlas(notworking)
  atlas = Sprite.new(
    'atlas.png',
    animations: {
      count: [
        {
          x: 0, y: 0,
          width: 35, height: 41,
          time: 300
        },
        {
          x: 26, y: 46,
          width: 35, height: 38,
          time: 400
        },
        {
          x: 65, y: 10,
          width: 32, height: 41,
          time: 500
        },
        {
          x: 10, y: 99,
          width: 32, height: 38,
          time: 600
        },
        {
          x: 74, y: 80,
          width: 32, height: 38,
          time: 700
        }
      ]
    }
  )
  atlas.play animation: :count, loop: true
  #tileset
  tileset = Tileset.new(
    'tileset.png',
    tile_width: 84,
    tile_height: 84,
    padding: 1,
    spacing: 2,
  )
  tileset.define_tile('red', 0, 0)
tileset.define_tile('blue', 1, 0)
tileset.define_tile('green', 0, 1)
tileset.define_tile('purple', 1, 1)
tileset.set_tile('green', [
    { x: 0,  y: 0 },
    { x: 84, y: 0 },
    { x: 0,  y: 84 }
])

tileset.set_tile('red', [
    { x: 84,  y: 84 }
])
Text.new(
    'MINECRAFT',
    x: 150, y: 200,
    font: 'Minecrafter.Reg.ttf',
    size: 40,
    color: 'blue',
    z: 10
  )
# Show the window
show