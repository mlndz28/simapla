import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AgrupacionesComponent } from './agrupaciones.component';

describe('AgrupacionesComponent', () => {
  let component: AgrupacionesComponent;
  let fixture: ComponentFixture<AgrupacionesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AgrupacionesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AgrupacionesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
