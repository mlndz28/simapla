import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AgrupacionesRoutingModule } from './agrupaciones-routing.module';
import { AgrupacionesComponent } from './agrupaciones.component';
import { PageHeaderModule } from './../../../shared';

@NgModule({
  imports: [
    CommonModule,
    AgrupacionesRoutingModule,
    PageHeaderModule
  ],
  declarations: [AgrupacionesComponent]
})
export class AgrupacionesModule { }
