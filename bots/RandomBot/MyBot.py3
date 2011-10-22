#!/usr/bin/env python3
from ants import Ants
import random

class MyBot:
    def __init__(self):
        pass
    
    def do_setup(self, ants):
        pass
    
    def do_turn(self, ants):
        for ant_loc in ants.my_ants():
            direction = random.choice(('n','e','s','w'))
            ants.issue_order((ant_loc,direction))

            if ants.time_remaining() < 10:
                break
            
if __name__ == '__main__':
    Ants.run(MyBot())
