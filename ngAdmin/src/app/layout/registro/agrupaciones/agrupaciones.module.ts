import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { SelectModule } from 'angular2-select';

import { AgrupacionesRoutingModule } from './agrupaciones-routing.module';
import { AgrupacionesComponent } from './agrupaciones.component';
import { PageHeaderModule } from './../../../shared';

@NgModule({
  imports: [
    CommonModule,
    AgrupacionesRoutingModule,
    SelectModule,
    FormsModule,
    PageHeaderModule
  ],
  declarations: [AgrupacionesComponent]
})
export class AgrupacionesModule { }
