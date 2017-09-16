import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
//import { SelectModule } from 'ng2-select-compat';
import { SelectModule } from 'angular2-select';


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
	SelectModule
  ],
  declarations: [InstrumentosComponent]
})
export class InstrumentosModule { }
