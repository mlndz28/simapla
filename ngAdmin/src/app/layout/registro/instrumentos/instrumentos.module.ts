import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { SelectModule } from 'angular2-select';
import { ToastModule } from 'ng2-toastr/ng2-toastr';

import { InstrumentosRoutingModule } from './instrumentos-routing.module';
import { InstrumentosComponent } from './instrumentos.component';
import { PageHeaderModule } from './../../../shared';

@NgModule({
  imports: [
    CommonModule,
    InstrumentosRoutingModule,
	FormsModule,
	HttpModule,
	PageHeaderModule,
	SelectModule,
	ToastModule.forRoot()
  ],
  declarations: [InstrumentosComponent]
})
export class InstrumentosModule { }
