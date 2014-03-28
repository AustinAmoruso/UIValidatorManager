UIValidatorManager
==================
Please create your own uihelper flashcell and stopflashcell methods. I have left these out to allow you to determine the kick back to the user. 


Useage
==================
[self.puvm createValidator:self.pName flash:self.pNameCell rule:^{return (bool)(self.pName.text.length > 3);}];

-(BOOL)valid
{
    [self.puvm setEnableed:true];
    return [self.puvm isValid];
}
