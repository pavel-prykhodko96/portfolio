import pygame # Functionality.
from pygame.sprite import Group # Behaves like a list with 
#some extra functionality that’s helpful when building games

from settings import Settings
from game_stats import GameStats
from scoreboard import Scoreboard
from button import Button
from ship import Ship
import game_functions as gf

def run_game():
    """Initialize pygame, objects and the main game loop."""
    pygame.init()    
    ai_settings = Settings()
    screen = pygame.display.set_mode(
        (ai_settings.screen_width, ai_settings.screen_height))
    pygame.display.set_caption("Alien Invasion")
    
    # Make the play button.
    play_button = Button(ai_settings, screen, "Play")
    
    # Create an instance to store game statistics and create a scoreboard.
    stats = GameStats(ai_settings)
    sb = Scoreboard(ai_settings, screen, stats)
    
    # Make a ship, a group of bullets and a group of aliens
    ship = Ship(ai_settings, screen)
    bullets = Group() 
    aliens = Group()
    stars = Group()
    
    # Draw the stars on the screen
    gf.create_stars(ai_settings, screen, stars)
    
    # Create the fleet of aliens
    gf.create_fleet(ai_settings, screen, ship, aliens)
    
    
    while True: # Start the main loop for the game.
        gf.check_events(ai_settings, screen, stats, sb, play_button, ship, 
            aliens, bullets)
        
        if stats.game_active:
            ship.update()
            gf.update_bullets(ai_settings, screen, stats, sb, ship, aliens, 
                bullets)     
            gf.update_aliens(ai_settings, screen, stats, sb, ship, aliens, 
                bullets)
        
        gf.update_screen(ai_settings, screen, stats, sb, ship, aliens, bullets, 
            play_button, stars)

run_game()
