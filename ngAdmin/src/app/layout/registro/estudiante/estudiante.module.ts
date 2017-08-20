import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EstudianteRoutingModule } from './estudiante-routing.module';
import { EstudianteComponent } from './estudiante.component';
import { PageHeaderModule } from './../../../shared';

@NgModule({
  imports: [
    CommonModule,
    EstudianteRoutingModule,
    PageHeaderModule
  ],
  declarations: [EstudianteComponent]
})
export class EstudianteModule { }
