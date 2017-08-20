import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AgrupacionesComponent } from './agrupaciones.component';

const routes: Routes = [
    { path: '', component: AgrupacionesComponent }
];


@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AgrupacionesRoutingModule { }
