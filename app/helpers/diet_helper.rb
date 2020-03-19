module DietHelper
    def date_brazilian_formates(date)
        date = date.to_s.split('-')
        formated_list = []
        formated_list << date[2]
        formated_list << date[1]
        formated_list << date[0]
        return formated_list.join('/')
    end
    def time_brazilian_formates(time)
        time = time.to_s.split(' ')
        formated_time = time[1].split(':')
        formated_time.delete(formated_time.last)
        return formated_time.join(':')
    end
end
