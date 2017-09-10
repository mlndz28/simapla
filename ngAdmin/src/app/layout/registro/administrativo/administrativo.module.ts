import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdministrativoRoutingModule } from './administrativo-routing.module';
import { AdministrativoComponent } from './administrativo.component';
import { PageHeaderModule } from './../../../shared';

@NgModule({
  imports: [
    CommonModule,
    AdministrativoRoutingModule,
    PageHeaderModule
  ],
  declarations: [AdministrativoComponent]
})
export class AdministrativoModule { }
