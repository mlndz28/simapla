import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { InstrumentosComponent } from './instrumentos.component'

const routes: Routes = [
		{path: '', component: InstrumentosComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class InstrumentosRoutingModule { }
