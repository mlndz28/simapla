import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { InstrumentosRoutingModule } from './instrumentos-routing.module';
import { InstrumentosComponent } from './instrumentos.component';
import { PageHeaderModule } from './../../../shared';

@NgModule({
  imports: [
    CommonModule,
    InstrumentosRoutingModule,
	FormsModule,
	PageHeaderModule
  ],
  declarations: [InstrumentosComponent]
})
export class InstrumentosModule { }
