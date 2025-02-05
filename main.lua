local ffi = require("ffi")
local C = ffi.load("particles")

-- Define our particle system in the FFI
ffi.cdef[[
    typedef struct {
        float pos[3];
        float vel[3];
        float lifetime;
        float size;
    } Particle;

    typedef struct {
        Particle* particles;
        int count;
        int max_particles;
    } ParticleSystem;

    void init_particle_system(ParticleSystem* ps, int max_particles);
    void emit_particle(ParticleSystem* ps, float x, float y, float z);
    void update_particles(ParticleSystem* ps, float dt);
]]

-- Create our particle system
local ps = ffi.new("ParticleSystem")
C.init_particle_system(ps, 10000)

-- Main loop
local last_time = os.clock()
while true do
    local current_time = os.clock()
    local dt = current_time - last_time
    last_time = current_time
    
    -- Emit new particles
    if ps.count < ps.max_particles then
        C.emit_particle(ps, 0, 0, 0)  -- emit from origin
    end
    
    -- Update all particles
    C.update_particles(ps, dt)
    
    -- Render would happen here (using the shader)
end
