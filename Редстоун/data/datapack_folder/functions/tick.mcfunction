execute if score *trig trigger matches 0 run scoreboard players set *t timer 24
execute if score *t timer matches 26.. run scoreboard players set *t timer 0
execute if score *trig trigger matches 1 run scoreboard players add *t timer 1
execute as @e[tag=protect] at @s unless block ~ ~ ~ minecraft:redstone_wire if entity @a[distance=..3,nbt={SelectedItem:{id:"minecraft:shears"}}] run summon item ~ ~ ~ {Motion:[0.0,0.4,0.0],Item:{id:"minecraft:lapis_lazuli",Damage:4,Count:1b,tag:{CustomModelData:8,EntityTag:{Invisible:1b},display:{Name:'[{"text":"Изоляция","italic":false,"color":"red","underlined":true}]'}}}}
execute as @e[tag=protect] at @s unless block ~ ~ ~ minecraft:redstone_wire run kill @s
execute as @e[type=item,nbt={Item:{id:"minecraft:lapis_lazuli"}}] at @s if block ~ ~ ~ minecraft:redstone_wire run tag @e[type=item,nbt={Item:{id:"minecraft:lapis_lazuli"}, OnGround:1b},tag=!protector] add protector
tag @e[type=minecraft:potion,tag=!boom] add boom
execute as @e[tag=protect] at @s run particle minecraft:dust 0 0 1 0.6 ~ ~-0.5 ~ 0.2 0.4 0.2 0.5 1
execute as @e[type=item,tag=protector] at @s unless entity @e[tag=protect, distance=..1] run summon armor_stand ~ ~ ~ {Tags:["protect"],NoGravity:1b,Small:1,Invisible:1,NoBasePlate:1}

execute as @a at @s unless block ~ ~ ~ minecraft:redstone_wire[power=0] if block ~ ~ ~ minecraft:redstone_wire unless entity @e[tag=protect, distance=..1] run scoreboard players set *trig trigger 1
execute as @a at @s unless block ~ ~ ~ minecraft:redstone_wire[power=0] if block ~ ~ ~ minecraft:redstone_wire unless entity @e[tag=protect, distance=..1] if score *t timer matches 25.. run playsound minecraft:redstone.wire master @s ~ ~ ~ 1
execute as @a at @s unless block ~ ~ ~ minecraft:redstone_wire unless entity @e[tag=protect, distance=..1] run scoreboard players set *trig trigger 0
execute as @a at @s unless block ~ ~ ~ minecraft:redstone_wire[power=0] if block ~ ~ ~ minecraft:redstone_wire unless entity @e[tag=protect, distance=..1] run effect give @s minecraft:instant_damage 1 0
execute as @e[tag=boom] at @s unless block ~ ~ ~ minecraft:redstone_wire[power=0] if block ~ ~ ~ minecraft:redstone_wire unless entity @e[tag=protect, distance=..1] run summon fireball ~ ~ ~ {power:[1.0,-2.0,1.0],Life:1,ExplosionPower:3}
execute as @e[type=!minecraft:armor_stand,type=!minecraft:player] at @s unless block ~ ~ ~ minecraft:redstone_wire[power=0] if block ~ ~ ~ minecraft:redstone_wire unless entity @e[tag=protect, distance=..1] run data modify entity @e[limit=1,distance=..1,type=!item] Fire set value 60
kill @e[tag=protector,nbt={OnGround:1b}]