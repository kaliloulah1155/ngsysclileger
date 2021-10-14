function cal_tmontant(tduree, tmontant) {

    let hduree = tduree;
    let hmontant = parseInt(tmontant);
    let delta = 0;
    let montant_totale = 0;

    htime = hduree.split(":");
    delta = parseInt(htime[0]) + parseInt(htime[1]) / 60;
    montant_totale = delta * hmontant;

    return montant_totale;

}

console.log(cal_tmontant('02:30', 25000));