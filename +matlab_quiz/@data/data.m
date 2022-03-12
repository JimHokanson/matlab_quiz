classdef data < handle
    %
    %   matlab_quiz.data
    
    %{
        data = matlab_quiz.data;
    %}
    
    properties
        questions
        answers
        hints
        tags
        difficulty_levels
        author
        creation_dates
    end
    
    methods
        function obj = data()
            root = fileparts(fileparts(fileparts(which('matlab_quiz.data'))));
            db_file_path = fullfile(root,'quiz_entries.xlsx');
            temp = readtable(db_file_path);
            obj.questions = temp.question;
            obj.answers = temp.answer;
            obj.hints = temp.hint;
            obj.tags = cellfun(@(x) split(x,';'),temp.tags,'un',0);
            obj.difficulty_levels = temp.difficulty_level;
            obj.author = temp.author;
            obj.creation_dates = temp.creation_date;
        end
    end
end

