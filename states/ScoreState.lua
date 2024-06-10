--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 20, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 50, VIRTUAL_WIDTH, 'center')

    -- Drawing the required medal(highest earned) after game ends.

    if self.score >= 5 and self.score < 6 then
        love.graphics.draw(bronze,190,66,0,0.34,0.34)
        love.graphics.printf("You won the Bronze Title!",0,230,VIRTUAL_WIDTH,'center')
    elseif self.score >= 6 and self.score < 10 then
        love.graphics.draw(silver,190,66,0,0.34,0.34)
        love.graphics.printf("You won the Silver Title!",0,230,VIRTUAL_WIDTH,'center')
    elseif self.score >= 10 then 
        love.graphics.draw(gold,190,66,0,0.34,0.34)
        love.graphics.printf("You won the Gold Title!",0,230,VIRTUAL_WIDTH,'center')
    elseif self.score < 5 then
        love.graphics.setFont(flappyFont)
        love.graphics.printf('Score above 5 to win a title!',0,150,VIRTUAL_WIDTH,'center')
    end

    
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press Enter to Play Again!', 0, 250, VIRTUAL_WIDTH, 'center')
end