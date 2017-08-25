import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ManejoGruposRoutingModule } from './manejo-grupos-routing.module';
import { ManejoGruposComponent } from './manejo-grupos.component';

@NgModule({
  imports: [
    CommonModule,
    ManejoGruposRoutingModule
  ],
  declarations: [ManejoGruposComponent]
})
export class ManejoGruposModule { }
