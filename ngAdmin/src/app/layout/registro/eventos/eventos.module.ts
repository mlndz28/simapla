import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EventosRoutingModule } from './eventos-routing.module';
import { EventosComponent } from './eventos.component';
import { PageHeaderModule } from './../../../shared';

@NgModule({
  imports: [
    CommonModule,
    EventosRoutingModule,
    PageHeaderModule
  ],
  declarations: [EventosComponent]
})
export class EventosModule { }
