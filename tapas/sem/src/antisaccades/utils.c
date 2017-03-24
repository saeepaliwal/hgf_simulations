/* aponteeduardo@gmail.com */
/* copyright (C) 2016 */

#include "antisaccades.h"

// Populate an array

int
populate_parameters_prosa(const double *theta, PROSA_PARAMETERS *stheta)
{
    stheta->kp = theta[0];
    stheta->tp = theta[1];
    stheta->ka = theta[2];
    stheta->ta = theta[3];
    stheta->ks = theta[4];
    stheta->ts = theta[5];

    stheta->t0 = theta[6];
    stheta->da = theta[7];
    stheta->p0 = theta[8];

    return 0;
}

int
populate_parameters_seri(const double *theta, SERI_PARAMETERS *stheta)
{
    stheta->kp = theta[0];
    stheta->tp = theta[1];
    stheta->ka = theta[2];
    stheta->ta = theta[3];
    stheta->ks = theta[4];
    stheta->ts = theta[5];

    stheta->pp = theta[6];
    stheta->ap = theta[7];

    stheta->t0 = theta[8];
    stheta->da = theta[9];
    stheta->p0 = theta[10];

    return 0;
}

int
populate_parameters_dora(const double *theta, DORA_PARAMETERS *stheta)
{
    stheta->kinv = theta[0];
    stheta->tinv = theta[1];

    stheta->kva = theta[2];
    stheta->tva = theta[3];

    stheta->kvp = theta[4];
    stheta->tvp = theta[5];

    stheta->ks = theta[6];
    stheta->ts = theta[7];

    stheta->t0 = theta[8];
    stheta->da = theta[9];
    stheta->p0 = theta[10];

    return 0;
}
