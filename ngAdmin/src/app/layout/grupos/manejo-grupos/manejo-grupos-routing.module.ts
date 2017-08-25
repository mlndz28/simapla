import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ManejoGruposComponent } from './manejo-grupos.component';

const routes: Routes = [
  { path: '', component: ManejoGruposComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ManejoGruposRoutingModule { }
