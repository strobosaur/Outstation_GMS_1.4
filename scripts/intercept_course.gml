///intercept_course(shooter, target, projectile speed)
//
//  Returns the course direction required to hit a moving target
//  at a given projectile speed, or (-1) if no solution is found.
//
//      origin      instance with position (x,y), real
//      target      instance with position (x,y) and (speed), real
//      speed       speed of the projectile, real
//
/// GMLscripts.com/license

    var source = argument0;
    var target = argument1;
    var spd = argument2;
    
    var tlen = target.len;
    var tdir = target.dir;
    var dist = point_distance(source.x, source.y, target.x, target.y);
    
    var time = dist / spd;
    var xx = target.x + lengthdir_x(tlen * time, tdir);
    var yy = target.y + lengthdir_y(tlen * time, tdir);
    
    return point_direction(source.x, source.y, xx, yy);
/*{
    var origin,target,pspeed,idir,alpha,phi,beta;
    origin = argument0;
    target = argument1;
    pspeed = argument2;
    idir = point_direction(origin.x,origin.y,target.x,target.y);
    alpha = target.len / pspeed;
    phi = degtorad(target.dir - idir);
    beta = alpha * sin(phi);
    if (abs(beta) >= 1) {
        return (-1);
    }
    idir += radtodeg(arcsin(beta));
    return idir;
}
