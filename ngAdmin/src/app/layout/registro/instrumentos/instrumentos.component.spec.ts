import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { InstrumentosComponent } from './instrumentos.component';

describe('InstrumentosComponent', () => {
  let component: InstrumentosComponent;
  let fixture: ComponentFixture<InstrumentosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ InstrumentosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(InstrumentosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
