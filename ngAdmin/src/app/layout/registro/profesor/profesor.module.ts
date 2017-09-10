import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProfesorRoutingModule } from './profesor-routing.module';
import { ProfesorComponent } from './profesor.component';
import { PageHeaderModule } from './../../../shared';

@NgModule({
  imports: [
    CommonModule,
    ProfesorRoutingModule,
    PageHeaderModule
  ],
  declarations: [ProfesorComponent]
})
export class ProfesorModule { }
