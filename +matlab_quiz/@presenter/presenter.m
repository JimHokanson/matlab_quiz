classdef presenter < handle
    %
    %   Class:
    %   matlab_quiz.presenter
    %
    %   See Also
    %   --------
    %   matlab_quiz.data
    
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
        cur_answer
        cur_hint
    end
    
    methods
        function obj = presenter()
            obj.h = matlab_quiz.presenter_app();

            obj.data = matlab_quiz.data();
            
            obj.cur_question_id = 1;
            obj.loadQuestion(); 
            
            obj.h.next.ButtonPushedFcn = @(~,~)obj.next();
            obj.h.previous.ButtonPushedFcn = @(~,~)obj.previous();
            obj.h.show_hint.ButtonPushedFcn = @(~,~)obj.showHint();
            obj.h.show_answer.ButtonPushedFcn = @(~,~)obj.showAnswer();
        end
        function previous(obj)
            obj.cur_question_id = obj.cur_question_id - 1;
            obj.loadQuestion();
        end
        function next(obj)
            obj.cur_question_id = obj.cur_question_id + 1;
            obj.loadQuestion();
        end
        function showHint(obj)
            obj.h.answer.Value = obj.cur_hint;
        end
        function showAnswer(obj)
            obj.h.answer.Value = obj.cur_answer;
        end
        function loadQuestion(obj)
            
            id = obj.cur_question_id;
            n_questions = length(obj.data.questions);
            if id < 1 
                id = 1;
                obj.cur_question_id = 1;
            elseif id > n_questions
                id = n_questions;
                obj.cur_question_id = n_questions;
            end
            
            obj.h.answer.Value = '';
            obj.cur_answer = obj.data.answers{id};
            obj.cur_hint = obj.data.hints{id};
            obj.h.question.Value = obj.data.questions{id};
            obj.h.difficulty.Value = obj.data.difficulty_levels(id);
            obj.h.tags.Items = obj.data.tags{id};
            
            
            %load question
            %clear answer
        end
    end
end

