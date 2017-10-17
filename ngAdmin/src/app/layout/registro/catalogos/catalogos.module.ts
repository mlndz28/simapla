import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpModule } from '@angular/http';
import { CatalogosComponent } from './catalogos.component';
import { CatalogosRoutingModule } from './catalogos-routing.module';
import { PageHeaderModule } from './../../../shared';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { ToastModule } from 'ng2-toastr/ng2-toastr';

@NgModule({
  imports: [
    CommonModule,
    CatalogosRoutingModule,
    HttpModule,
    Ng2SmartTableModule,
    PageHeaderModule,
  	ToastModule.forRoot(),
  ],
  declarations: [CatalogosComponent]
})
export class CatalogosModule { }
