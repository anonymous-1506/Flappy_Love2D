--[[
    BaseState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Used as the base class for all of our states, so we don't have to
    define empty methods in each of them. StateMachine requires each
    State have a set of four "interface" methods that it can reliably call,
    so by inheriting from this base state, our State classes will all have
    at least empty versions of these methods even if we don't define them
    ourselves in the actual classes.
]]
    --initializing the newImages of the medals
_G. gold = love.graphics.newImage('GoldFlappy.png')
_G. silver = love.graphics.newImage('SilverFlappy.png')
_G. bronze = love.graphics.newImage('BronzeFlappy.png')

BaseState = Class{}

function BaseState:init()
    self.score = 0
end
function BaseState:enter() end
function BaseState:exit() end
function BaseState:update(dt) end
function BaseState:render() end