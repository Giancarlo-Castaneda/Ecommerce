import Foundation

extension AttributeModel {

    init(_ dto: ProductDTO.Attribute) {
        self.init(id: dto.id, name: dto.name, valueId: dto.valueId, valueName: dto.valueName)
    }
}
