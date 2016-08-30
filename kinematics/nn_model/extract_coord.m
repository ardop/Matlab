function p = extract_coord(fkmatp)

    [nx, ny, nz, ox, oy, oz, ax, ay, az, px, py, pz] = tmap(fkmatp);
    p = [px; py; pz];
    
end