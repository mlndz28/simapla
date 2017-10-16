import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CatalogosComponent } from './catalogos.component';
import { CatalogosRoutingModule } from './catalogos-routing.module';
import { PageHeaderModule } from './../../../shared';
import { Ng2SmartTableModule } from 'ng2-smart-table';

@NgModule({
  imports: [
    CommonModule,
    CatalogosRoutingModule,
    Ng2SmartTableModule,
    PageHeaderModule,
  ],
  declarations: [CatalogosComponent]
})
export class CatalogosModule { }
