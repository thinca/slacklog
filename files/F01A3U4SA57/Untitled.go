type CPU struct {}

func (cpu *CPU) Run() {
    Step(cpu)
}

func Step(cpu *CPU) {
    cpu.Fetch()
}

func (cpu *CPU) Fetch() {
    // blah blah blah ...
}