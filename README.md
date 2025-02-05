# particle-simulation
Think of a particle system like a big virtual snow globe. You have tons of tiny floating bits (we call them particles) bouncing around in 3D space. Each little particle knows:

Where it is
Which way it's moving
How long it'll stick around
What it looks like (color, size, etc.)

The cool part is you've got this constant flow - new particles are being born while old ones fade away. Maybe they're shooting up from a fountain, or drifting down like snow, or swirling around in a tornado pattern.
The physics can be pretty simple (just gravity) or get fancy with wind patterns, vortexes, and particles that interact with each other. Games use these all the time for stuff like fire, smoke, magic spells, explosions - basically anything that needs lots of small moving pieces to look convincing.
Under the hood, the CPU figures out where everything should move, and then the GPU draws it all really fast. That's the basic idea!
