import pygame
from pygame.sprite import Sprite
from random import randint

class Star(Sprite):#MY CODE
    
    def __init__(self, ai_settings, screen):
        """ Initialize the star and set random position on the screen."""
        super().__init__()
        self.screen = screen
        self.ai_settings = ai_settings
        
        self.image = pygame.image.load("images/star.bmp")
        self.rect = self.image.get_rect()
        
        # Set a random position in the frames of screen
        self.rect.centerx = randint(0, self.ai_settings.screen_width)
        self.rect.centery = randint(0, self.ai_settings.screen_height)
        
