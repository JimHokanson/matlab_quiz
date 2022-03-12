classdef presenter < handle
    %
    %   Class:
    %   matlab_quiz.presenter
    
    %{
        matlab_quiz.presenter
    %}
    
    %relevant tags
    %------------------------
    %ID
    %answer
    %question
    %show_hint
    %tags
    %difficulty
    %previous
    %next
    
    properties
        h
        data
        cur_question_id = 1
    end
    
    methods
        function obj = presenter()
            obj.h = matlab_quiz.presenter_app;
            obj.data = matlab_quiz.data();
            
            
            
            
            obj.loadQuestion(1);
            
            
            keyboard
        end
        function previous(obj)
            
        end
        function next(obj)
            
        end
        function showHint(obj)
            
        end
        function showAnwer(obj)
            
        end
        function loadQuestion(obj,id)
            
            %load question
            %clear answer
        end
    end
end

