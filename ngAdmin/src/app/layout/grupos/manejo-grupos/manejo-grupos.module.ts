import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ManejoGruposRoutingModule } from './manejo-grupos-routing.module';
import { ManejoGruposComponent } from './manejo-grupos.component';
import { PageHeaderModule } from './../../../shared';

@NgModule({
  imports: [
    CommonModule,
    ManejoGruposRoutingModule,
    PageHeaderModule
  ],
  declarations: [ManejoGruposComponent]
})
export class ManejoGruposModule { }
